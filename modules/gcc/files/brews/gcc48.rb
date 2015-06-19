require 'formula'

class Gcc48 < Formula
  def arch
    if Hardware::CPU.type == :intel
      if MacOS.prefer_64_bit?
        'x86_64'
      else
        'i686'
      end
    elsif Hardware::CPU.type == :ppc
      if MacOS.prefer_64_bit?
        'powerpc64'
      else
        'powerpc'
      end
    end
  end

  def osmajor
    `uname -r`.chomp
  end

  homepage 'http://gcc.gnu.org'
  url 'http://ftpmirror.gnu.org/gcc/gcc-4.8.3/gcc-4.8.3.tar.bz2'
  mirror 'ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.8.3/gcc-4.8.3.tar.bz2'
  sha1 'da0a2b9ec074f2bf624a34f3507f812ebb6e4dce'
  version '4.8.3-boxen2'

  head 'svn://gcc.gnu.org/svn/gcc/branches/gcc-4_8-branch'

  bottle do
    sha1 '97867c4e70e4eeaf98d42ad06a23a189abec3cc7' => :tiger_g3
    sha1 'ddda3f3dae94812ef263a57fd2abe85bf97c3ca0' => :tiger_altivec
    sha1 '3a01572c16a8bcde4fb53554790b350c31161309' => :tiger_g4e
    sha1 '063016966578350a6048e22b45e468c3dc991619' => :leopard_g3
    sha1 '16a24c342514a4917533c172cddbfb3156153adc' => :leopard_altivec
  end

  option 'enable-fortran', 'Build the gfortran compiler'
  option 'enable-java', 'Build the gcj compiler'
  option 'enable-all-languages', 'Enable all compilers and languages, except Ada'
  option 'enable-nls', 'Build with native language support (localization)'
  option 'enable-profiled-build', 'Make use of profile guided optimization when bootstrapping GCC'
  # enabling multilib on a host that can't run 64-bit results in build failures
  option 'disable-multilib', 'Build without multilib support' if MacOS.prefer_64_bit?

  depends_on 'gmp4'
  depends_on 'libmpc08'
  depends_on 'mpfr2'
  depends_on 'cloog018'
  depends_on 'isl011'
  depends_on 'ecj' if build.include? 'enable-java' or build.include? 'enable-all-languages'

  if build.stable? and MacOS.version >= :yosemite
    patch :DATA
  end

  fails_with :gcc_4_0

  def install
    # GCC bootstraps itself, so it is OK to have an incompatible C++ stdlib
    cxxstdlib_check :skip

    # GCC will suffer build errors if forced to use a particular linker.
    ENV.delete 'LD'

    if MacOS.version < :leopard
      ENV["AS"] = ENV["AS_FOR_TARGET"] = "#{Formula["cctools"].bin}/as"
    end

    if build.include? 'enable-all-languages'
      # Everything but Ada, which requires a pre-existing GCC Ada compiler
      # (gnat) to bootstrap. GCC 4.6.0 add go as a language option, but it is
      # currently only compilable on Linux.
      languages = %w[c c++ fortran java objc obj-c++]
    else
      # C, C++, ObjC compilers are always built
      languages = %w[c c++ objc obj-c++]

      languages << 'fortran' if build.include? 'enable-fortran'
      languages << 'java' if build.include? 'enable-java'
    end

    version_suffix = version.to_s.slice(/\d\.\d/)

    args = [
      "--build=#{arch}-apple-darwin#{osmajor}",
      "--prefix=#{prefix}",
      "--enable-languages=#{languages.join(',')}",
      # Make most executables versioned to avoid conflicts.
      "--program-suffix=-#{version_suffix}",
      "--with-gmp=#{Formula["gmp4"].opt_prefix}",
      "--with-mpfr=#{Formula["mpfr2"].opt_prefix}",
      "--with-mpc=#{Formula["libmpc08"].opt_prefix}",
      "--with-cloog=#{Formula["cloog018"].opt_prefix}",
      "--with-isl=#{Formula["isl011"].opt_prefix}",
      "--with-system-zlib",
      # This ensures lib, libexec, include are sandboxed so that they
      # don't wander around telling little children there is no Santa
      # Claus.
      "--enable-version-specific-runtime-libs",
      "--enable-libstdcxx-time=yes",
      "--enable-stage1-checking",
      "--enable-checking=release",
      "--enable-lto",
      # Use 'bootstrap-debug' build configuration to force stripping of object
      # files prior to comparison during bootstrap (broken by Xcode 6.3).
      "--with-build-config=bootstrap-debug",
      # A no-op unless --HEAD is built because in head warnings will
      # raise errors. But still a good idea to include.
      "--disable-werror",
      "--with-pkgversion=Homebrew #{name} #{pkg_version} #{build.used_options*" "}".strip,
      "--with-bugurl=https://github.com/Homebrew/homebrew-versions/issues",
    ]

    # "Building GCC with plugin support requires a host that supports
    # -fPIC, -shared, -ldl and -rdynamic."
    args << "--enable-plugin" if MacOS.version > :tiger

    # Otherwise make fails during comparison at stage 3
    # See: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=45248
    args << '--with-dwarf2' if MacOS.version < :leopard

    args << '--disable-nls' unless build.include? 'enable-nls'

    if build.include? 'enable-java' or build.include? 'enable-all-languages'
      args << "--with-ecj-jar=#{Formula["ecj"].opt_prefix}/share/java/ecj.jar"
    end

    if !MacOS.prefer_64_bit? || build.include?('disable-multilib')
      args << '--disable-multilib'
    else
      args << '--enable-multilib'
    end

    mkdir 'build' do
      unless MacOS::CLT.installed?
        # For Xcode-only systems, we need to tell the sysroot path.
        # 'native-system-header's will be appended
        args << "--with-native-system-header-dir=/usr/include"
        args << "--with-sysroot=#{MacOS.sdk_path}"
      end

      system '../configure', *args

      if build.include? 'enable-profiled-build'
        # Takes longer to build, may bug out. Provided for those who want to
        # optimise all the way to 11.
        system 'make profiledbootstrap'
      else
        system 'make bootstrap'
      end

      # At this point `make check` could be invoked to run the testsuite. The
      # deja-gnu and autogen formulae must be installed in order to do this.

      system 'make install'
    end

    # Handle conflicts between GCC formulae

    # Since GCC 4.8 libffi stuff are no longer shipped.

    # Rename libiberty.a.
    Dir.glob(prefix/"**/libiberty.*") { |file| add_suffix file, version_suffix }

    # Rename man7.
    Dir.glob(man7/"*.7") { |file| add_suffix file, version_suffix }

    # Even when suffixes are appended, the info pages conflict when
    # install-info is run. TODO fix this.
    info.rmtree

    # Rename java properties
    if build.include? 'enable-java' or build.include? 'enable-all-languages'
      config_files = [
        "#{lib}/logging.properties",
        "#{lib}/security/classpath.security",
        "#{lib}/i386/logging.properties",
        "#{lib}/i386/security/classpath.security"
      ]

      config_files.each do |file|
        add_suffix file, version_suffix if File.exist? file
      end
    end
  end

  def add_suffix file, suffix
    dir = File.dirname(file)
    ext = File.extname(file)
    base = File.basename(file, ext)
    File.rename file, "#{dir}/#{base}-#{suffix}#{ext}"
  end
end

__END__
diff --git a/gcc/config/darwin-c.c b/gcc/config/darwin-c.c
index 892ba35..7fe4b1f 100644
--- a/gcc/config/darwin-c.c
+++ b/gcc/config/darwin-c.c
@@ -571,21 +571,34 @@ find_subframework_header (cpp_reader *pfile, const char *header, cpp_dir **dirp)
 }
 
 /* Return the value of darwin_macosx_version_min suitable for the
-   __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ macro,
-   so '10.4.2' becomes 1040.  The lowest digit is always zero.
+   __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ macro, so '10.4.2'
+   becomes 1040 and '10.10.0' becomes 101000.  The lowest digit is
+   always zero, as is the second lowest for '10.10.x' and above.
    Print a warning if the version number can't be understood.  */
 static const char *
 version_as_macro (void)
 {
-  static char result[] = "1000";
+  static char result[7] = "1000";
+  int minorDigitIdx;
 
   if (strncmp (darwin_macosx_version_min, "10.", 3) != 0)
     goto fail;
   if (! ISDIGIT (darwin_macosx_version_min[3]))
     goto fail;
-  result[2] = darwin_macosx_version_min[3];
-  if (darwin_macosx_version_min[4] != '\0'
-      && darwin_macosx_version_min[4] != '.')
+
+  minorDigitIdx = 3;
+  result[2] = darwin_macosx_version_min[minorDigitIdx++];
+  if (ISDIGIT (darwin_macosx_version_min[minorDigitIdx]))
+  {
+    /* Starting with OS X 10.10, the macro ends '00' rather than '0',
+       i.e. 10.10.x becomes 101000 rather than 10100.  */
+    result[3] = darwin_macosx_version_min[minorDigitIdx++];
+    result[4] = '0';
+    result[5] = '0';
+    result[6] = '\0';
+  }
+  if (darwin_macosx_version_min[minorDigitIdx] != '\0'
+      && darwin_macosx_version_min[minorDigitIdx] != '.')
     goto fail;
 
   return result;
diff --git a/gcc/config/darwin-driver.c b/gcc/config/darwin-driver.c
index 8b6ae93..eb478e8 100644
--- a/gcc/config/darwin-driver.c
+++ b/gcc/config/darwin-driver.c
@@ -57,8 +57,6 @@ darwin_find_version_from_kernel (char *new_flag)
   version_p = osversion + 1;
   if (ISDIGIT (*version_p))
     major_vers = major_vers * 10 + (*version_p++ - '0');
-  if (major_vers > 4 + 9)
-    goto parse_failed;
   if (*version_p++ != '.')
     goto parse_failed;
   version_pend = strchr(version_p, '.');
diff --git a/gcc/testsuite/gcc.dg/darwin-minversion-1.c b/gcc/testsuite/gcc.dg/darwin-minversion-1.c
index d8a3243..6221d61 100644
--- a/gcc/testsuite/gcc.dg/darwin-minversion-1.c
+++ b/gcc/testsuite/gcc.dg/darwin-minversion-1.c
@@ -2,7 +2,8 @@
 /* { dg-options "-mmacosx-version-min=10.1" } */
 /* { dg-do run { target *-*-darwin* } } */
 
-int main(void)
+int
+main ()
 {
 #if __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ != 1010
   fail me;
diff --git a/gcc/testsuite/gcc.dg/darwin-minversion-2.c b/gcc/testsuite/gcc.dg/darwin-minversion-2.c
index fd4975a..8e18d52 100644
--- a/gcc/testsuite/gcc.dg/darwin-minversion-2.c
+++ b/gcc/testsuite/gcc.dg/darwin-minversion-2.c
@@ -2,7 +2,8 @@
 /* { dg-options "-mmacosx-version-min=10.1 -mmacosx-version-min=10.3" } */
 /* { dg-do run { target *-*-darwin* } } */
 
-int main(void)
+int
+main ()
 {
 #if __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ != 1030
   fail me;
diff --git a/gcc/testsuite/gcc.dg/darwin-minversion-3.c b/gcc/testsuite/gcc.dg/darwin-minversion-3.c
index d0c5934..4fcb969 100644
--- a/gcc/testsuite/gcc.dg/darwin-minversion-3.c
+++ b/gcc/testsuite/gcc.dg/darwin-minversion-3.c
@@ -2,7 +2,8 @@
 /* { dg-options "-mmacosx-version-min=10.4.10" } */
 /* { dg-do compile { target *-*-darwin* } } */
 
-int main(void)
+int
+main ()
 {
 #if __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ != 1040
   fail me;
diff --git a/gcc/testsuite/gcc.dg/darwin-minversion-4.c b/gcc/testsuite/gcc.dg/darwin-minversion-4.c
new file mode 100644
index 0000000..1cb42eb
--- /dev/null
+++ b/gcc/testsuite/gcc.dg/darwin-minversion-4.c
@@ -0,0 +1,12 @@
+/* Test that major versions greater than 9 work and have the additional 0.  */
+/* { dg-options "-mmacosx-version-min=10.10.0" } */
+/* { dg-do compile { target *-*-darwin* } } */
+
+int
+main ()
+{
+#if __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ != 101000
+  fail me;
+#endif
+  return 0;
+}

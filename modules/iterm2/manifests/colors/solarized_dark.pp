# Public: Imports the Solarized Dark colorscheme
#
# Usage:
#
#   include iterm2::colors::solarized_dark
class iterm2::colors::solarized_dark (
  $ansi_0_color = [
    0.0,
    0.15575926005840302,
    0.19370138645172119,
  ],
  $ansi_1_color = [
    0.81926977634429932,
    0.10840655118227005,
    0.14145714044570923,
  ],
  $ansi_2_color = [
    0.44977453351020813,
    0.54115492105484009,
    0.020208755508065224,
  ],
  $ansi_3_color = [
    0.64746475219726562,
    0.46751424670219421,
    0.023484811186790466,
  ],
  $ansi_4_color = [
    0.12754884362220764,
    0.46265947818756104,
    0.78231418132781982,
  ],
  $ansi_5_color = [
    0.77738940715789795,
    0.10802463442087173,
    0.43516635894775391,
  ],
  $ansi_6_color = [
    0.14679534733295441,
    0.57082360982894897,
    0.52502274513244629,
  ],
  $ansi_7_color = [
    0.91611063480377197,
    0.89001238346099854,
    0.79781103134155273,
  ],
  $ansi_8_color = [
    0.51171875,
    0.578125,
    0.5859375,
  ],
  $ansi_9_color = [
    0.74176257848739624,
    0.21325300633907318,
    0.073530435562133789,
  ],
  $ansi_10_color = [
    0.27671992778778076,
    0.35665956139564514,
    0.38298487663269043,
  ],
  $ansi_11_color = [
    0.32436618208885193,
    0.40717673301696777,
    0.43850564956665039,
  ],
  $ansi_12_color = [
    0.44058024883270264,
    0.50962930917739868,
    0.51685798168182373,
  ],
  $ansi_13_color = [
    0.34798634052276611,
    0.33896297216415405,
    0.72908437252044678,
  ],
  $ansi_14_color = [
    0.50599193572998047,
    0.56485837697982788,
    0.56363654136657715,
  ],
  $ansi_15_color = [
    0.98943418264389038,
    0.95794391632080078,
    0.86405980587005615,
  ],
  $background_color = [
    0.0,
    0.11783610284328461,
    0.15170273184776306,
  ],
  $bold_color = [
    0.50599193572998047,
    0.56485837697982788,
    0.56363654136657715,
  ],
  $cursor_color = [
    0.44058024883270264,
    0.50962930917739868,
    0.51685798168182373,
  ],
  $cursor_text_color = [
    0.0,
    0.15575926005840302,
    0.19370138645172119,
  ],
  $foreground_color = [
    0.44058024883270264,
    0.50962930917739868,
    0.51685798168182373,
  ],
  $selected_text_color = [
    0.50599193572998047,
    0.56485837697982788,
    0.56363654136657715,
  ],
  $selection_color = [
    0.0,
    0.15575926005840302,
    0.19370138645172119,
  ],
) {
  iterm2::colors { 'Solarized Dark':
    ansi_0_color        => $ansi_0_color,
    ansi_1_color        => $ansi_1_color,
    ansi_2_color        => $ansi_2_color,
    ansi_3_color        => $ansi_3_color,
    ansi_4_color        => $ansi_4_color,
    ansi_5_color        => $ansi_5_color,
    ansi_6_color        => $ansi_6_color,
    ansi_7_color        => $ansi_7_color,
    ansi_8_color        => $ansi_8_color,
    ansi_9_color        => $ansi_9_color,
    ansi_10_color       => $ansi_10_color,
    ansi_11_color       => $ansi_11_color,
    ansi_12_color       => $ansi_12_color,
    ansi_13_color       => $ansi_13_color,
    ansi_14_color       => $ansi_14_color,
    ansi_15_color       => $ansi_15_color,
    background_color    => $background_color,
    bold_color          => $bold_color,
    cursor_color        => $cursor_color,
    cursor_text_color   => $cursor_text_color,
    foreground_color    => $foreground_color,
    selected_text_color => $selected_text_color,
    selection_color     => $selection_color,
  }
}

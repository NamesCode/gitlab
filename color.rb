# frozen_string_literal: true

config = '../../config.ru'
require config if File.file? config
FLAVOUR ||= '.'

module Gitlab
  class Color
    PATTERN = /\A\#(?:[0-9A-Fa-f]{3}){1,2}\Z/

    def initialize(value)
      @value = value&.strip&.freeze
    end

    CATPPUCCIN = [
      mocha: {rosewater: '#f5e0dc', flamingo: '#f2cdcd', pink: '#f5c2e7', mauve: '#cba6f7', red: '#f38ba8', maroon: '#eba0ac', peach: '#fab387', yellow: '#f9e2af', green: '#a6e3a1', teal: '#94e2d5', sky: '#89dceb', sapphire: '#74c7ec', blue: '#89b4fa', lavender: '#b4befe', text: '#cdd6f4', subtext1: '#bac2de', subtext0: '#a6adc8', overlay2: '#9399b2', overlay1: '#7f849c', overlay0: '#6c7086', surface2: '#585b70', surface1: '#45475a', surface0: '#313244', base: '#1e1e2e', mantle: '#181825', crust: '#11111b', },
      macchiato: {rosewater: '#f4dbd6', flamingo: '#f0c6c6', pink: '#f5bde6', mauve: '#c6a0f6', red: '#ed8796', maroon: '#ee99a0', peach: '#f5a97f', yellow: '#eed49f', green: '#a6da95', teal: '#8bd5ca', sky: '#91d7e3', sapphire: '#7dc4e4', blue: '#8aadf4', lavender: '#b7bdf8', text: '#cad3f5', subtext1: '#b8c0e0', subtext0: '#a5adcb', overlay2: '#939ab7', overlay1: '#8087a2', overlay0: '#6e738d', surface2: '#5b6078', surface1: '#494d64', surface0: '#363a4f', base: '#24273a', mantle: '#1e2030', crust: '#181926', },
      frappe: {rosewater: '#f2d5cf', flamingo: '#eebebe', pink: '#f4b8e4', mauve: '#ca9ee6', red: '#e78284', maroon: '#ea999c', peach: '#ef9f76', yellow: '#e5c890', green: '#a6d189', teal: '#81c8be', sky: '#99d1db', sapphire: '#85c1dc', blue: '#8caaee', lavender: '#babbf1', text: '#c6d0f5', subtext1: '#b5bfe2', subtext0: '#a5adce', overlay2: '#949cbb', overlay1: '#838ba7', overlay0: '#737994', surface2: '#626880', surface1: '#51576d', surface0: '#414559', base: '#303446', mantle: '#292c3c', crust: '#232634', },
      latte: {rosewater: '#dc8a78', flamingo: '#dd7878', pink: '#ea76cb', mauve: '#8839ef', red: '#d20f39', maroon: '#e64553', peach: '#fe640b', yellow: '#df8e1d', green: '#40a02b', teal: '#179299', sky: '#04a5e5', sapphire: '#209fb5', blue: '#1e66f5', lavender: '#7287fd', text: '#4c4f69', subtext1: '#5c5f77', subtext0: '#6c6f85', overlay2: '#7c7f93', overlay1: '#8c8fa1', overlay0: '#9ca0b0', surface2: '#acb0be', surface1: '#bcc0cc', surface0: '#ccd0da', base: '#eff1f5', mantle: '#e6e9ef', crust: '#dce0e8', },
    ];

    case FLAVOUR
    when "macchiato", "Macchiato"
      CHOSEN_SCHEME = CATPPUCCIN[:macchiato]
    when "frappe", "Frappe"
      CHOSEN_SCHEME = CATPPUCCIN[:frappe]
    when "latte", "Latte"
      CHOSEN_SCHEME = CATPPUCCIN[:latte]
    else
      CHOSEN_SCHEME = CATPPUCCIN[:mocha]
    end

    module Constants
      DARK = Color.new(CHOSEN_SCHEME[:base])
      LIGHT = Color.new(CHOSEN_SCHEME[:text])

      COLOR_NAME_TO_HEX = {
        black: CHOSEN_SCHEME[:crust],
        silver: CHOSEN_SCHEME[:surface2],
        gray: CHOSEN_SCHEME[:surface1],
        white: CHOSEN_SCHEME[:text],
        maroon: CHOSEN_SCHEME[:maroon],
        red: CHOSEN_SCHEME[:red],
        purple: CHOSEN_SCHEME[:mauve],
        fuchsia: CHOSEN_SCHEME[:mauve],
        green: CHOSEN_SCHEME[:green],
        lime: CHOSEN_SCHEME[:teal],
        olive: CHOSEN_SCHEME[:green],
        yellow: CHOSEN_SCHEME[:yellow],
        navy: CHOSEN_SCHEME[:blue],
        blue: CHOSEN_SCHEME[:sapphire],
        teal: CHOSEN_SCHEME[:teal],
        aqua: CHOSEN_SCHEME[:sky],
        orange: CHOSEN_SCHEME[:peach],
        aliceblue: CHOSEN_SCHEME[:base],
        antiquewhite: CHOSEN_SCHEME[:text],
        aquamarine: CHOSEN_SCHEME[:teal],
        azure: CHOSEN_SCHEME[:sapphire],
        beige: CHOSEN_SCHEME[:rosewater],
        bisque: CHOSEN_SCHEME[:flamingo],
        blanchedalmond: CHOSEN_SCHEME[:rosewater],
        blueviolet: CHOSEN_SCHEME[:lavender],
        brown: CHOSEN_SCHEME[:flamingo],
        burlywood: CHOSEN_SCHEME[:flamingo],
        cadetblue: CHOSEN_SCHEME[:sky],
        chartreuse: CHOSEN_SCHEME[:green],
        chocolate: CHOSEN_SCHEME[:flamingo],
        coral: CHOSEN_SCHEME[:pink],
        cornflowerblue: CHOSEN_SCHEME[:blue],
        cornsilk: CHOSEN_SCHEME[:flamingo],
        crimson: CHOSEN_SCHEME[:red],
        darkblue: CHOSEN_SCHEME[:blue],
        darkcyan: CHOSEN_SCHEME[:sapphire],
        darkgoldenrod: CHOSEN_SCHEME[:yellow],
        darkgray: CHOSEN_SCHEME[:overlay0],
        darkgreen: CHOSEN_SCHEME[:green],
        darkgrey: CHOSEN_SCHEME[:overlay0],
        darkkhaki: CHOSEN_SCHEME[:green],
        darkmagenta: CHOSEN_SCHEME[:mauve],
        darkolivegreen: CHOSEN_SCHEME[:green],
        darkorange: CHOSEN_SCHEME[:peach],
        darkorchid: CHOSEN_SCHEME[:mauve],
        darkred: CHOSEN_SCHEME[:red],
        darksalmon: CHOSEN_SCHEME[:maroon],
        darkseagreen: CHOSEN_SCHEME[:green],
        darkslateblue: CHOSEN_SCHEME[:lavender],
        darkslategray: CHOSEN_SCHEME[:surface2],
        darkslategrey: CHOSEN_SCHEME[:surface2],
        darkturquoise: CHOSEN_SCHEME[:teal],
        darkviolet: CHOSEN_SCHEME[:lavender],
        deeppink: CHOSEN_SCHEME[:mauve],
        deepskyblue: CHOSEN_SCHEME[:sky],
        dimgray: CHOSEN_SCHEME[:overlay1],
        dimgrey: CHOSEN_SCHEME[:overlay1],
        dodgerblue: CHOSEN_SCHEME[:blue],
        firebrick: CHOSEN_SCHEME[:red],
        floralwhite: CHOSEN_SCHEME[:text],
        forestgreen: CHOSEN_SCHEME[:green],
        gainsboro: CHOSEN_SCHEME[:lavender],
        ghostwhite: CHOSEN_SCHEME[:text],
        gold: CHOSEN_SCHEME[:yellow],
        goldenrod: CHOSEN_SCHEME[:yellow],
        greenyellow: CHOSEN_SCHEME[:green],
        grey: CHOSEN_SCHEME[:overlay1],
        honeydew: CHOSEN_SCHEME[:green],
        hotpink: CHOSEN_SCHEME[:pink],
        indianred: CHOSEN_SCHEME[:red],
        indigo: CHOSEN_SCHEME[:sky],
        ivory: CHOSEN_SCHEME[:text],
        khaki: CHOSEN_SCHEME[:green],
        lavender: CHOSEN_SCHEME[:lavender],
        lavenderblush: CHOSEN_SCHEME[:lavender],
        lawngreen: CHOSEN_SCHEME[:green],
        lemonchiffon: CHOSEN_SCHEME[:yellow],
        lightblue: CHOSEN_SCHEME[:sky],
        lightcoral: CHOSEN_SCHEME[:flamingo],
        lightcyan: CHOSEN_SCHEME[:teal],
        lightgoldenrodyellow: CHOSEN_SCHEME[:yellow],
        lightgray: CHOSEN_SCHEME[:overlay2],
        lightgreen: CHOSEN_SCHEME[:green],
        lightgrey: CHOSEN_SCHEME[:overlay2],
        lightpink: CHOSEN_SCHEME[:pink],
        lightsalmon: CHOSEN_SCHEME[:maroon],
        lightseagreen: CHOSEN_SCHEME[:green],
        lightskyblue: CHOSEN_SCHEME[:sky],
        lightslategray: CHOSEN_SCHEME[:subtext0],
        lightslategrey: CHOSEN_SCHEME[:subtext0],
        lightsteelblue: CHOSEN_SCHEME[:yellow],
        lightyellow: CHOSEN_SCHEME[:yellow],
        limegreen: CHOSEN_SCHEME[:green],
        linen: CHOSEN_SCHEME[:text],
        mediumaquamarine: CHOSEN_SCHEME[:teal],
        mediumblue: CHOSEN_SCHEME[:blue],
        mediumorchid: CHOSEN_SCHEME[:lavender],
        mediumpurple: CHOSEN_SCHEME[:mauve],
        mediumseagreen: CHOSEN_SCHEME[:green],
        mediumslateblue: CHOSEN_SCHEME[:blue],
        mediumspringgreen: CHOSEN_SCHEME[:green],
        mediumturquoise: CHOSEN_SCHEME[:teal],
        mediumvioletred: CHOSEN_SCHEME[:red],
        midnightblue: CHOSEN_SCHEME[:blue],
        mintcream: CHOSEN_SCHEME[:text],
        mistyrose: CHOSEN_SCHEME[:pink],
        moccasin: CHOSEN_SCHEME[:rosewater],
        navajowhite: CHOSEN_SCHEME[:text],
        oldlace: CHOSEN_SCHEME[:rosewater],
        olivedrab: CHOSEN_SCHEME[:green],
        orangered: CHOSEN_SCHEME[:peach],
        orchid: CHOSEN_SCHEME[:lavender],
        palegoldenrod: CHOSEN_SCHEME[:yellow],
        palegreen: CHOSEN_SCHEME[:green],
        paleturquoise: CHOSEN_SCHEME[:sapphire],
        palevioletred: CHOSEN_SCHEME[:maroon],
        papayawhip: CHOSEN_SCHEME[:peach],
        peachpuff: CHOSEN_SCHEME[:pink],
        peru: CHOSEN_SCHEME[:pink],
        pink: CHOSEN_SCHEME[:pink],
        plum: CHOSEN_SCHEME[:mauve],
        powderblue: CHOSEN_SCHEME[:sky],
        rosybrown: CHOSEN_SCHEME[:rosewater],
        royalblue: CHOSEN_SCHEME[:blue],
        saddlebrown: CHOSEN_SCHEME[:rosewater],
        salmon: CHOSEN_SCHEME[:maroon],
        sandybrown: CHOSEN_SCHEME[:rosewater],
        seagreen: CHOSEN_SCHEME[:green],
        seashell: CHOSEN_SCHEME[:text],
        sienna: CHOSEN_SCHEME[:rosewater],
        skyblue: CHOSEN_SCHEME[:sky],
        slateblue: CHOSEN_SCHEME[:blue],
        slategray: CHOSEN_SCHEME[:subtext0],
        slategrey: CHOSEN_SCHEME[:subtext0],
        snow: CHOSEN_SCHEME[:text],
        springgreen: CHOSEN_SCHEME[:green],
        steelblue: CHOSEN_SCHEME[:blue],
        tan: CHOSEN_SCHEME[:rosewater],
        thistle: CHOSEN_SCHEME[:lavender],
        tomato: CHOSEN_SCHEME[:red],
        turquoise: CHOSEN_SCHEME[:sapphire],
        violet: CHOSEN_SCHEME[:lavender],
        wheat: CHOSEN_SCHEME[:rosewater],
        whitesmoke: CHOSEN_SCHEME[:text],
        yellowgreen: CHOSEN_SCHEME[:yellow],
        rebeccapurple: CHOSEN_SCHEME[:mauve]
      }.stringify_keys.transform_values { Color.new(_1) }.freeze
    end

    def self.of(color)
      raise ArgumentError, 'No color spec' unless color
      return color if color.is_a?(self)

      color = color.to_s.strip
      Constants::COLOR_NAME_TO_HEX[color.downcase] || new(color)
    end

    # Generate a hex color based on hex-encoded value
    def self.color_for(value)
      Color.new("##{Digest::SHA256.hexdigest(value.to_s)[0..5]}")
    end

    def to_s
      @value.to_s
    end

    def as_json(_options = nil)
      to_s
    end

    def eql(other)
      return false unless other.is_a?(self.class)

      to_s == other.to_s
    end
    alias_method :==, :eql

    def valid?
      PATTERN.match?(@value)
    end

    # Implementation should match
    # https://gitlab.com/gitlab-org/gitlab-ui/-/blob/6245128c7256e3d8db164b92e9580c79d47e9183/src/utils/utils.js#L52-55
    def to_srgb(value)
      normalized = value / 255.0
      normalized <= 0.03928 ? normalized / 12.92 : ((normalized + 0.055) / 1.055)**2.4
    end

    # Implementation should match
    # https://gitlab.com/gitlab-org/gitlab-ui/-/blob/6245128c7256e3d8db164b92e9580c79d47e9183/src/utils/utils.js#L57-64
    def relative_luminance(rgb)
      # WCAG 2.1 formula: https://www.w3.org/TR/WCAG21/#dfn-relative-luminance
      # -
      # WCAG 3.0 will use APAC
      # Using APAC would be the ultimate goal, but was dismissed by engineering as of now
      # See https://gitlab.com/gitlab-org/gitlab-ui/-/merge_requests/3418#note_1370107090
      (0.2126 * to_srgb(rgb[0])) + (0.7152 * to_srgb(rgb[1])) + (0.0722 * to_srgb(rgb[2]))
    end

    # Implementation should match
    # https://gitlab.com/gitlab-org/gitlab-ui/-/blob/6245128c7256e3d8db164b92e9580c79d47e9183/src/utils/utils.js#L66-91
    def light?
      return false unless valid?

      luminance = relative_luminance(rgb)
      light_luminance = relative_luminance([255, 255, 255])
      dark_luminance = relative_luminance([31, 30, 36])

      contrast_light = (light_luminance + 0.05) / (luminance + 0.05)
      contrast_dark = (luminance + 0.05) / (dark_luminance + 0.05)

      # Using a threshold contrast of 2.4 instead of 3
      # as this will solve weird color combinations in the mid tones
      #
      # Note that this is the negated condition from GitLab UI,
      # because the GitLab UI implementation returns the text color,
      # while this defines whether a background color is light
      !(contrast_light >= 2.4 || contrast_light > contrast_dark)
    end

    def luminosity
      return :light if light?

      :dark
    end

    def contrast
      return Constants::DARK if light?

      Constants::LIGHT
    end

    private

    def rgb
      return [] unless valid?

      @rgb ||= if @value.length == 4
                 @value[1, 4].scan(/./).map { |v| (v * 2).hex }
               else
                 @value[1, 7].scan(/.{2}/).map(&:hex)
               end
    end
  end
end

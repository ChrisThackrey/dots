'use strict';
// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',
    // default font size in pixels for all tabs
    fontSize: 15,
    // font family with optional fallbacks
    fontFamily: '"JetBrainsMono Nerd Font Mono"',
    uiFontFamily: 'MonoLisa',
    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',
    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',
    // line height as a relative unit
    lineHeight: 1,
    // letter spacing as a relative unit
    letterSpacing: 0,
    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.8)',
    // terminal text color under BLOCK cursor
    cursorAccentColor: '#000',
    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BEAM',
    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,
    // color of the text
    foregroundColor: '#ffffff',
    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: '#5b5b64',
    // terminal selection color
    selectionColor: 'rgba(248,28,229,0.3)',
    // border color (window, tabs)
    borderColor: '#333',
    // custom CSS to embed in the main window
    css: 'body {color: red; border-width: 10px;} .hyper_main {border-width: 0; border-radius: 10px; overflow: hidden;} #hyper {border-width: 0; border-radius: 10px; overflow: hidden;} #mount {border-width: 0; border-radius: 10px; overflow: hidden;} body > div {border-width: 0; border-radius: 10px; overflow: hidden;} #hyperborder {border-width: 0; border-radius: 10px; overflow: hidden;}',
    // custom CSS to embed in the terminal window
    termCSS: '',
    // set custom startup directory (must be an absolute path)
    workingDirectory: '',
    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',
    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: '',
    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '10px',
    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    // colors: {
    //   black: '#000000',
    //   red: '#C51E14',
    //   green: '#1DC101',
    //   yellow: '#C7C329',
    //   blue: '#0A2FC4',
    //   magenta: '#C839C5',
    //   cyan: '#20C5C6',
    //   white: '#C7C7C7',
    //   lightBlack: '#686868',
    //   lightRed: '#FD6F6B',
    //   lightGreen: '#67F86F',
    //   lightYellow: '#FFFA72',
    //   lightBlue: '#6A76FB',
    //   lightMagenta: '#FD7CFC',
    //   lightCyan: '#68FDFE',
    //   lightWhite: '#FFFFFF',
    //   limeGreen: '#32CD32',
    //   lightCoral: '#F08080',
    // },
    // Rosé Pine
    // theme: {
    //   // Default: core
    //   // Can be core, moon or dawn
    //   variant: 'dawn',
    // },
    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '/usr/bin/fish',
    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],
    // for environment variables
    env: {},
    // Supported Options:
    //  1. 'SOUND' -> Enables the bell as a sound
    //  2. false: turns off the bell
    bell: 'SOUND',
    windowSize: [1200, 820],
    scrollback: 1000,
    // An absolute file path to a sound file on the machine.
    // bellSoundURL: '/path/to/sound/file',
    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: false,
    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,
    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    quickEdit: false,
    // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
    // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
    // (inside tmux or vim with mouse mode enabled for example).
    macOptionSelectionMode: 'force',
    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: true,
    // keypress required for weblink activation: [ctrl|alt|meta|shift]
    // todo: does not pick up config changes automatically, need to restart terminal :/
    webLinksActivationKey: '',
    // if `false` (without backticks and without quotes), Hyper will use ligatures provided by some fonts
    disableLigatures: false,
    // set to true to disable auto updates
    disableAutoUpdates: false,
    hyperBorder: {
      animate: {
        duration: '1000',
      },
      borderColors: ['#fc1da7', '#fba506'],
      borderWidth: '0.2rem',
      borderRadiusInner: '10px',
      borderRadiusOuter: '10px',
    },
    hypercwd: {
      initialWorkingDirectory: '~/dev/main',
    },
    // hyperWindowSize: {
    //   transform: true,
    //   width: 180,
    //   height: 80,
    //   startX: 70,
    //   startY: 70,
    // },
    hyperSpotify: {
      position: 'bottom', // or 'bottom'
      margin: 'default', // or 'double' or custom value
      controlsPosition: 'default', // or 'left' or 'right'
    },
    hyperTabs: {
      trafficButtons: true,
      border: false,
      tabIcons: true,
      tabIconsColored: true,
      activityColor: 'salmon',
      closeAlign: 'right',
      activityPulse: true,
    },
    hyperSearchUI: {
      inputBorderRadius: 2,
      buttonBorderRadius: 2,
      buttonMargin: 2,
      prevButton: '←',
      nextButton: '→',
    },
    // wallpapers: {
    //   // solid: {
    //   //   color: '#421F41',
    //   // },
    //   video: [
    //     {
    //       source:
    //         'https://cdn.dribbble.com/users/288987/screenshots/15269498/media/3e7d1d6ca30d7793f72168cb99d6e5b8.mp4',
    //       speed: 0.8,
    //     },
    //   ],
    //   // image: [
    //   //   {
    //   //     source:
    //   //       'https://lh3.googleusercontent.com/proxy/pVwXyJdsROLTGHwWQmiPH4xEj-ZE1VjlAJbQN9jAYprMD7QV4R25AFoyFq2Cn0yhKnzCCTKw2lgffd4yeUxUQGljk6IhZqo',
    //   //     position: '90% 50%',
    //   //     size: '35%',
    //   //     color: '#08103a',
    //   //   },
    //   // ],
    //   //   gradient: [
    //   //     {
    //   //       colors: ['#F17C58', '#E94584', '#24AADB', '#27DBB1', '#FFDC18', '#FF3706'],
    //   //       animationTime: 30,
    //   //       timingFunction: 'linear',
    //   //       gradientAngle: 270,
    //   //     },
    //   //     {
    //   //       colors: ['#421F41', '#0475A2'],
    //   //       animationTime: 5,
    //   //       timingFunction: 'linear',
    //   //       gradientAngle: 270,
    //   //     },
    //   //   ],
    // },
    hyperStatusLine: {
      background: '#191622',
      foreground: '#fff',
      cwdHoverColor: '#78D1E1',
      branchHoverColor: '#FF79C6',
      fontFamily: 'Fira Code',
      dirtyColor: 'salmon',
      aheadColor: 'ivory',
      isTransparent: true,
    },
    // alternateScroll: {
    //   // 1 to 100 is supported
    //   scrollSpeed: 80,
    // },
    // hyperTransparentDynamic: {
    //   alpha: 0.5, // default 50%
    // },
    // verminal: {
    //   fontFamily: '"Hack Nerd Font"',
    //   fontSize: 16,
    // },
    // for advanced config flags please refer to https://hyper.is/#cfg
    // hyper-pokemon plugin settings
    // pokemon: 'gengar', // Define your favorite pokemon theme
    // pokecursor: 'true', // Activate your theme's pokecursor
    // pokemonSyntax: 'dark', // Define the color of the terminal tabs
    // unibody: 'true', // Define the color of the Hyper window header
    // poketab: 'false', // Deactivate your theme's poketab
  },
  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    // 'hyper-atom-dark-transparent',
    // 'hyper-altair',
    // 'hyper-pokemon',
    // 'hyperterm-dibdabs',
    // 'hyperterm-hipster',
    // 'hyperterm-cobalt2-theme',
    // 'hyper-chesterish',
    // 'hyper-pinguimcriativo-theme',
    // 'hyper-lighthaus',
    // 'hyper-omni-theme',
    // 'hyper-clean',
    // 'hyper-overnight-slumber',
    // 'hyper-dracula',
    // 'hyper-bloody',
    // 'hyper-smooth-theme',
    'hypercwd',
    'hyper-statusline',
    'hyper-spotify',
    // 'hyper-pane',
    // 'hyperterm-tabs',
    'hypergoogle',
    // 'hyper-snazzy',
    'hyper-search',
    // 'hyperterm-safepaste',
    // 'hyper-dance-party',
    // 'hyperminimal',
    // 'hyperterm-alternatescroll',
    // 'hyper-city-lights',
    // 'hyperterm-bold-tab',
    // 'hyper-github-dark-dimmed',
    // 'hyper-midnight',
    'hyper-hide-scroll',
    // 'hyper-moonlite',
    // 'hyper-hide-title',
    // 'hyperterm-new-moon-theme',
    'hyper-transparent-dynamic',
    // 'hyper-nord',
    'hyperdocs',
    // 'hyper-one-dark-vivid',
    'hyper-fileio',
    // 'hyper-polarbear',
    // 'hyperterm-focus-reporting',
    // 'hyper-ramda',
    // 'hyperterm-cursor',
    // 'hyper-rose-pine',
    'hyperborder',
    'hyper-sierra-vibrancy',
    // 'hyper-sierra',
    // 'hyper-sweet',
    // 'hyper-electron-highlighter',
    // 'hyperterm-gooey',
    // 'hyperterm-material-spacegray',
    // 'hyperterm-panda',
    // 'verminal',
    // 'hyper-material-theme',
    // 'hyper-subliminal-theme',
    'hyper-dnd-tabs',
    'hyper-drop-file',
    // 'hyper-fading-scrollbar',
    'hyper-active-tab',
    // 'hyper-whimsy',
    // 'hyper-website-theme',
    // 'hyper-firefox-devtools',
    // 'hyper-flat',
  ],
  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  // localPlugins: ['hyper-dynamic-wallpaper'],
  localPlugins: [],
  keymaps: {
    // Example
    // 'window:devtools': 'command+alt+o',
  },
};
//# sourceMappingURL=config-default.js.map
const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/typography'),
    require('flowbite/plugin')
  ],
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.erb',
    './app/views/**/*.haml',
    './app/views/**/*.slim',
    './node_modules/flowbite/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        primary: colors.blue,
        secondary: colors.emerald,
        tertiary: colors.gray,
        danger: colors.red,
        "code-400": "#fefcf9",
        "code-600": "#3c455b",
        "light-blue": colors.sky,
        "warm-gray": colors.stone,
        "true-gray": colors.neutral,
        "cool-gray": colors.gray,
        "blue-gray": colors.slate,
        ...colors,
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      typography: (theme) => ({
        DEFAULT: {
          css: {
            color: theme('colors.gray.900'),
            a: {
              color: theme('colors.blue.600'),
              '&:hover': {
                color: theme('colors.blue.700'),
              },
            },
            strong: {
              color: theme('colors.gray.900'),
            },
            'ol > li::before': {
              color: theme('colors.gray.500'),
            },
            'ul > li::before': {
              backgroundColor: theme('colors.gray.400'),
            },
            hr: {
              borderColor: theme('colors.gray.200'),
            },
          },
        },
      }),
    },
  },
}

module.exports = {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {
        textColor: {
            skin: {
                base: 'var(--color-text-base)',
                muted: 'var(--color-text-muted)',
                'main-accent': 'var(--color-main-accent)',
            }
        },
        backgroundColor: {
            skin: {
                'main-accent': 'var(--color-main-accent)',
            }
        }
    },
  },
  plugins: [],
}

# Labhole

Labhole is a science-ethics advocacy site that promotes ethics, respect, and
morals in science and research environments. The tagline says it all: *"Don't
be a labhole. Have morals."*

The site is live at [labhole.github.io](https://labhole.github.io).

## How It's Built

Labhole is a static site built with [Jekyll](https://jekyllrb.com/) and
deployed automatically via [GitHub Pages](https://pages.github.com/).

* **Static site generator:** Jekyll
* **Hosting:** GitHub Pages (auto-deployed from the repository)
* **Markdown processor:** [kramdown](https://kramdown.gettalong.org/) with
    GitHub-Flavored Markdown (GFM) input
* **Theme:** Fully custom dark-mode design — no remote theme or gem-based theme
    is used. The layout and styles are defined entirely within the repository.
* **Typography:** [Montserrat](https://fonts.google.com/specimen/Montserrat),
    self-hosted from `css/fonts/` in `.woff2` format (not loaded from Google
    Fonts at runtime)
* **Dependencies:** Managed through the `github-pages` gem, which pins all
    Jekyll plugins and dependencies to the exact versions used by the GitHub
    Pages build environment.

## Color Palette

The site uses a dark-mode palette defined as CSS custom properties in
`css/style.css`. All colors are chosen for readability and AA contrast
compliance on a dark background.

| Variable             | Hex       | Semantic Name     | Usage                                       |
| -------------------- | --------- | ----------------- | ------------------------------------------- |
| `--color-bg`         | `#211103` | Very dark brown   | Page background                             |
| `--color-text`       | `#E8E0DA` | Parchment (muted) | Body text                                   |
| `--color-heading`    | `#659389` | Light green       | Headings                                    |
| `--color-accent`     | `#557E73` | Muted green       | Borders, horizontal rules, blockquote accent |
| `--color-link`       | `#C4793E` | Toffee brown      | Links                                       |
| `--color-link-hover` | `#E8E0DA` | Parchment (muted) | Link hover state                            |
| `--color-code-bg`    | `#2C1E10` | Dark brown        | Inline code background                      |
| `--color-pre-bg`     | `#1D1A05` | Very dark green   | Code block background                       |
| `--color-pre-text`   | `#E8E0DA` | Parchment (muted) | Code block text                             |
| `--color-strong`     | `#FBF7F4` | Parchment (full)  | Bold text emphasis                          |

## Typography

The site uses **Montserrat** for both body text and headings. Five font files
are self-hosted under `css/fonts/` in `.woff2` format — the site does not
depend on Google Fonts at runtime.

Included weights:

* 300 (light)
* 400 (regular)
* 400 italic
* 600 (semi-bold)
* 700 (bold)

Fallback stacks:

* **Body & Headings:** `"Montserrat", "Segoe UI", "Helvetica Neue", Arial, sans-serif`
* **Monospace (code):** `"SFMono-Regular", "Consolas", "Liberation Mono", "Menlo", monospace`

## File Structure

```
labhole.github.io/
├── _config.yml              # Jekyll configuration (metadata, kramdown, URL settings)
├── _layouts/
│   └── default.html         # HTML5 single-column layout with nav buttons
├── css/
│   ├── fonts/               # Self-hosted Montserrat .woff2 font files
│   │   ├── montserrat-300.woff2
│   │   ├── montserrat-400.woff2
│   │   ├── montserrat-400-italic.woff2
│   │   ├── montserrat-600.woff2
│   │   └── montserrat-700.woff2
│   └── style.css            # Custom dark-mode theme stylesheet
├── scripts/
│   └── serve.sh             # One-command local development server script
├── index.md                 # Home page — "Don't be a labhole."
├── conduct.md               # Code of Conduct page
├── letter.md                # Open Letter page
├── aspiring_researchers.md  # Aspiring Researchers page
├── support.md               # Show Your Support page
├── .gitignore               # Git ignore rules (build artifacts, swap files)
├── Gemfile                  # Ruby dependencies (github-pages gem)
├── Gemfile.lock             # Locked dependency versions
└── README.md                # This file
```

## Key Files

* **`_config.yml`** — Jekyll configuration. Defines the site title
    (`labhole.fyi`), tagline, description, kramdown settings with GFM input,
    base URL for GitHub Pages, `pretty` permalink style, and the list of files
    excluded from the build.

* **`Gemfile`** — Declares the `github-pages` gem as the sole Ruby dependency,
    ensuring local builds match the GitHub Pages environment exactly.

* **`_layouts/default.html`** — The HTML5 page template. Features include:
    * A **skip-navigation link** (`Skip to main content`) for keyboard and
        screen-reader accessibility.
    * An **inline SVG favicon** (🔬 microscope emoji) — no external favicon
        file is needed.
    * A **top navigation bar** built as a `<ul>` / `<li>` list with five
        pill-style nav buttons: *Home*, *Code of Conduct*, *Open Letter*,
        *Aspiring Researchers*, and *Show Your Support*.
    * A **current-page indicator** — the active page's button receives an
        `aria-current="page"` attribute and a filled accent background via CSS.
    * A centered **single-column main content area**. There is no header banner
        or footer.

* **`css/style.css`** — The complete custom dark-mode theme. Defines CSS custom
    properties for the color palette, self-hosted Montserrat `@font-face`
    declarations, a responsive layout (max width of **860px**), styled elements
    (blockquotes, code blocks, tables, lists, horizontal rules, images), and a
    mobile breakpoint at 600px.

* **`css/fonts/`** — Self-hosted Montserrat font files in `.woff2` format.
    Five weights/styles are included (300, 400, 400 italic, 600, 700).

* **`index.md`** — The home page. Uses the `default` layout.

* **`conduct.md`** — Code of Conduct page. Uses the `default` layout.

* **`letter.md`** — Open Letter page. Uses the `default` layout.

* **`aspiring_researchers.md`** — Aspiring Researchers page. Uses the `default`
    layout.

* **`support.md`** — Show Your Support page. Uses the `default` layout.

* **`scripts/serve.sh`** — A Bash helper script that checks for Ruby and
    Bundler, installs dependencies into `vendor/bundle`, and starts the Jekyll
    development server bound to `0.0.0.0` (useful for WSL). Accepts extra
    arguments such as `--port`.

## Local Development

To run the site locally, you need **Ruby** (>= 2.7) and **Bundler** installed.

### Quick Start (Recommended)

The `scripts/serve.sh` script handles dependency installation and starts the
development server in one command:

```sh
./scripts/serve.sh
```

To serve on a custom port:

```sh
./scripts/serve.sh --port 5000
```

The server binds to `0.0.0.0` by default so it is accessible from a Windows
host when running inside WSL.

### Manual Setup

1. **Install Ruby** (version 2.7 or later). See the
    [Ruby installation guide](https://www.ruby-lang.org/en/documentation/installation/)
    for your platform.

2. **Install Bundler** (if not already installed):

    ```sh
    gem install bundler
    ```

3. **Install project dependencies:**

    ```sh
    bundle install
    ```

4. **Start the local development server:**

    ```sh
    bundle exec jekyll serve --watch
    ```

5. **Open your browser** and navigate to `http://localhost:4000`.

The server watches for file changes and automatically rebuilds the site. Press
`Ctrl+C` to stop it.

## Adding New Content

To add a new page to the site:

1. **Create a Markdown file** in the project root (e.g. `about.md`).

2. **Add Jekyll front matter** at the top of the file to specify the layout:

    ```markdown
    ---
    layout: default
    ---

    # About

    Your page content goes here.
    ```

3. **Write your content** in Markdown below the front matter. The kramdown
    processor supports standard Markdown as well as GitHub-Flavored Markdown
    extensions (fenced code blocks, tables, etc.).

4. **Add a nav link** by editing `_layouts/default.html`. Insert a new `<li>`
    inside the `<ul class="nav-list">` element:

    ```html
    <li><a class="nav-btn" href="{{ "/about/" | relative_url }}" {% if page.url == "/about/" %}aria-current="page"{% endif %}>About</a></li>
    ```

5. **Access the page** at a URL matching the filename. With the `pretty`
    permalink setting, `about.md` will be served at `/about/`.

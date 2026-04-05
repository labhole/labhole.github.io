# Labhole

## How It's Built

Labhole is built with [Jekyll](https://jekyllrb.com/), the static site
generator supported natively by GitHub Pages. Key technical details:

* **Static site generator:** Jekyll
* **Hosting:** GitHub Pages (deployed automatically from the repository)
* **Markdown processor:** [kramdown](https://kramdown.gettalong.org/) with
    GitHub-Flavored Markdown (GFM) input
* **Theme:** Fully custom — no remote theme or gem-based theme is used. The
    layout and styles are defined entirely within the repository.
* **Dependencies:** Managed through the `github-pages` gem, which pins all
    Jekyll plugins and dependencies to the exact versions used by the GitHub
    Pages build environment.

## Color Palette

The site uses a five-color palette defined as CSS custom properties in
`css/style.css`:

| Color            | Hex       | Usage                              |
| ---------------- | --------- | ---------------------------------- |
| Muted green      | `#557E73` | Header background, accents         |
| Very dark green  | `#1D1A05` | Body text, footer background       |
| Very dark brown  | `#211103` | Headings, emphasis, secondary text |
| Parchment        | `#FBF7F4` | Page background                    |
| Toffee brown     | `#8F5A30` | Links, interactive elements        |

## File Structure

```
labhole.github.io/
├── _config.yml          # Jekyll configuration (title, kramdown, URL settings)
├── .gitignore           # Git ignore rules (build artifacts, caches)
├── Gemfile              # Ruby dependencies (github-pages gem)
├── _layouts/
│   └── default.html     # HTML5 layout with header, main content, and footer
├── css/
│   └── style.css        # Custom theme stylesheet (5-color palette)
├── index.md             # Home page (placeholder content)
└── README.md            # This file
```

### Key Files

* **`_config.yml`** — Defines the site title ("Labhole"), description, kramdown
    settings, base URL, and files excluded from the build.
* **`Gemfile`** — Declares the `github-pages` gem as the sole dependency.
* **`_layouts/default.html`** — The HTML5 page template. Includes a header with
    the site name and tagline, a centered single-column content area, and a
    footer.
* **`css/style.css`** — The complete custom theme. Provides responsive
    typography (Georgia serif for body, sans-serif for headings), styled
    elements (blockquotes, code blocks, tables, lists, horizontal rules), and a
    mobile breakpoint at 600px.
* **`index.md`** — The home page, written in Markdown with Jekyll front matter.
    Currently contains placeholder content about science ethics.

## Local Development

To run the site locally, you need **Ruby** and **Bundler** installed.

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
    bundle exec jekyll serve
    ```

5. **Open your browser** and navigate to `http://localhost:4000`.

The server watches for file changes and automatically rebuilds the site. Press
`Ctrl+C` to stop it.

## Adding New Content

To add a new page to the site:

1. **Create a Markdown file** in the project root (e.g. `about.md`).

2. **Add Jekyll front matter** at the top of the file to specify the layout and
    page title:

    ```markdown
    ---
    layout: default
    title: About
    ---

    Your page content goes here.
    ```

3. **Write your content** in Markdown below the front matter. The kramdown
    processor supports standard Markdown as well as GitHub-Flavored Markdown
    extensions (fenced code blocks, tables, etc.).

4. **Access the page** at a URL matching the filename. With the `pretty`
    permalink setting, `about.md` will be served at `/about/`.

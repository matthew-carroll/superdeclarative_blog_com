# blog

A new Jaspr project

---

## Local Development & Build Commands

* **Install dependencies:**
  ```bash
  dart pub get
  ```

* **Run the development server with Hot Reload:**
  ```bash
  dart pub global run jaspr_cli:jaspr serve
  ```
  *(Launches the development server at `http://localhost:8080`)*

* **Build the blog statically for production:**
  ```bash
  dart pub global run jaspr_cli:jaspr build
  ```
  *(Generates the production static site inside `build/jaspr/`)*

---

## Writing Markdown Blog Posts

Your blog posts are managed in standard Markdown format inside the `content/` directory:

1. **Write your post:**
   Create a `.md` file inside `content/` (e.g., `content/my-awesome-post.md`). Use standard YAML frontmatter for metadata:
   ```markdown
   ---
   title: My Awesome Post Title
   date: September 7, 2026
   excerpt: A brief summary of this amazing post.
   ---
   This is the actual post body in Markdown.
   ```

2. **Register the route (Static-Site Generation Requirement):**
   Open `lib/app.dart` and add a static route for your new post to the Router:
   ```dart
   Route(path: '/post/my-awesome-post', title: 'My Awesome Post Title', builder: (context, state) => const PostPage(id: 'my-awesome-post')),
   ```

3. **Compile your posts:**
   Run our high-speed compilation script to parse and update your post list:
   ```bash
   dart run bin/compile_posts.dart
   ```
   *(Your local development server or production builder will hot-reload instantly and pick up the new posts!)*

---

## Composing the About Page

You can compose and edit the contents of your **About Page** using Markdown inside **`content/about.md`**! 

* The compiler parses it and compiles it natively.
* The `/about` route loads this compiled Markdown dynamically, maintaining identical, high-contrast, modern typography and block-level spacings.
* It is automatically excluded from your main blog homepage post feed and `/post/about` route registry.

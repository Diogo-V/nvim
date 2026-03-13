return { -- Adds AI to neovim
  "folke/sidekick.nvim",
  dependencies = { "ibhagwan/fzf-lua" },
  opts = {
    cli = {
      win = {
        watch = true,
        keys = {
          buffers = { "<c-b>", "buffers", mode = "nt", desc = "open buffer picker" },
          files = { "<c-f>", "files", mode = "nt", desc = "open file picker" },
          hide_ctrl_q = { "<c-q>", "hide", mode = "nt", desc = "hide the terminal window" },
          hide_ctrl_z = { "<c-z>", "hide", mode = "nt", desc = "hide the terminal window" },
          stopinsert = { "<c-n>", "stopinsert", mode = "t", desc = "enter normal mode" },
          nav_left = { "<c-h>", "nav_left", desc = "navigate to the left window" },
          nav_down = { "<c-j>", "nav_down", desc = "navigate to the below window" },
          nav_up = { "<c-k>", "nav_up", desc = "navigate to the above window" },
          nav_right = { "<c-l>", "nav_right", desc = "navigate to the right window" },
          prompt = false,
        },
      },
      mux = {
        backend = "tmux",
        enabled = true,
        create = "terminal",
        split = {
          vertical = true,
          size = 0.5,
        },
      },
      tools = {
        opencode = {
          cmd = { "opencode" },
          env = { OPENCODE_THEME = "system" },
        },
      },
      prompts = {
        review = "Perform a rigorous audit of my uncommitted changes. Prioritize: 1. Logic errors/race conditions 2. Security vulnerabilities 3. Consistency with existing architecture. Think step-by-step and provide a summary of concerns followed by specific fixes.",
        diagnostics = "Analyze the root cause of these diagnostics in {file}: {diagnostics}. Use your tools to understand the surrounding context and provide the most surgical, idiomatic fix possible. Avoid side effects.",
        diagnostics_all = "Address all reported diagnostics in the current context: {diagnostics_all}. Group related issues and apply holistic fixes that improve code health while resolving the errors. Run tests after if possible.",
        document = "Add idiomatic, high-value documentation to {function|line}. Focus on *why* the code exists and its edge cases. Match the project's existing documentation flavor (JSDoc, Docstrings, etc.) exactly.",
        explain = "Deconstruct {this} for a senior engineer. Explain the underlying implementation details, its position in the system's data flow, and any non-obvious side effects or performance characteristics.",
        fix = "Identify and resolve the bug in {this}. First, 'think' about the failure mode. Then, use 'grep' or 'glob' to see how similar issues are handled elsewhere before implementing the most robust fix.",
        optimize = "Profile {this} for efficiency. Identify algorithmic bottlenecks (O-notation) and suggest improvements that maintain readability. If a trade-off between speed and complexity exists, explain it clearly.",
        improvements = "Evaluate {file} for modern best practices and maintainability. Look for: 1. DRY violations 2. Type safety improvements 3. Better abstraction patterns. Propose refactors that align with the current stack's evolution.",
        tests = "Draft a comprehensive test suite for {this} using the project's preferred framework. Include happy paths, boundary conditions, and negative tests. Ensure mocks/stubs match existing test patterns.",
        commit = "Craft a concise, imperative-style commit message for the changes in {file}. Follow the 'Conventional Commits' specification if applicable, focusing on the 'why' rather than the 'what'.",
      },
      picker = "fzf-lua",
    },
    copilot = {
      status = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "x" },
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
    {
      "<leader>aq",
      function()
        require("sidekick.cli").close()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Quit",
    },
  },
}

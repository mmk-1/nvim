return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty",
        kitty_method = "normal",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            only_render_image_at_cursor = false,
            download_remote_images = true,
            filetypes = { "markdown" },
            resolve_image_path = function(document_path, image_path, fallback)
              -- Function to resolve the image path in Obsidian vaults
              local assets_dir = vim.fn.expand("~/Dropbox/obsidian/master/000_Attachments")
              if image_path:match("^/") then
                  return image_path
              end

              local new_image_path = assets_dir .. "/" .. image_path
              if vim.fn.filereadable(new_image_path) == 1 then
                  return new_image_path
              else
                  return fallback(document_path, image_path)
              end
          end,
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
          -- This is disabled by default
          html = {
            enabled = true,
          },
          -- This is disabled by default
          css = {
            enabled = true,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 40,
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        -- Auto show/hide images when the editor gains/looses focus
        editor_only_render_when_focused = true,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
      })
    end,
  },
}

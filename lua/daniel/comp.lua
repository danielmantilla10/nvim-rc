-- Solo aplica para archivos .cpp
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    -- Ruta al archivo comp.cpp
    local comp_cpp_path = "/home/daniel/cp/comp.cpp"

    -- Función para leer palabras de un archivo
    local function get_words_from_file(path)
      local words = {}
      local file = io.open(path, "r")
      if not file then return words end
      for line in file:lines() do
        for word in line:gmatch("[%w_]+") do
          words[word] = true
        end
      end
      file:close()
      return vim.tbl_keys(words)
    end

    -- Cargar palabras de comp.cpp y del buffer actual
    local comp_words = get_words_from_file(comp_cpp_path)

    -- Actualizar palabras del buffer actual en InsertEnter
    vim.api.nvim_create_autocmd("InsertEnter", {
      buffer = 0,
      callback = function()
        local buffer_text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
        local buffer_words = {}
        for word in buffer_text:gmatch("[%w_]+") do
          buffer_words[word] = true
        end
        vim.b.cpp_complete_words = vim.tbl_extend("force", comp_words, buffer_words)
      end,
    })

    -- Configurar completado manual con Tab como <C-p>
    vim.keymap.set("i", "<Tab>", function()
      return vim.fn.pumvisible() == 1 and "<C-p>" or "<Tab>"
    end, { expr = true, buffer = true })

    -- Autocompletado al escribir letras
    vim.api.nvim_create_autocmd("InsertCharPre", {
      buffer = 0,
      callback = function(args)
        local char = args.char
        if char:match("[%w_]") then
          -- Obtener palabras únicas del buffer y comp.cpp
          local words = vim.b.cpp_complete_words or {}
          local current_line = vim.api.nvim_get_current_line()
          local before_cursor = current_line:sub(1, vim.fn.col(".") - 1)
          local prefix = before_cursor:match("[%w_]*$")

          if #prefix > 0 then
            local matches = vim.tbl_filter(function(w)
              return w:lower():find(prefix:lower(), 1, true) == 1
            end, words)

            if #matches > 0 then
              vim.fn.complete(vim.fn.col(".") - #prefix, matches)
            end
          end
        end
      end,
    })

    -- Evitar que el menú aparezca con espacios, tabs o enters
    vim.api.nvim_create_autocmd("InsertEnter", {
      buffer = 0,
      callback = function()
        vim.opt_local.completeopt = { "menu", "menuone", "noselect" }
      end,
    })
  end,
})

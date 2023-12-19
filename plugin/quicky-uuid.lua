if vim.fn.has("nvim-0.7.0") ~= 1 then
	vim.api.nvim_err_writeln("Quicky UUID require nvim >= 0.7.0")
end

vim.api.nvim_create_user_command("UUID", function()
	local uuid = require("quicky-uuid.uuid")

	local id = uuid()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local current_line_text = vim.fn.getline(line)

	local start_text = vim.fn.strcharpart(current_line_text, 0, col)
	local end_text = vim.fn.strcharpart(current_line_text, col, #current_line_text)
	local text_to_insert = start_text .. id .. end_text

	vim.fn.setline(line, text_to_insert)
end, {})

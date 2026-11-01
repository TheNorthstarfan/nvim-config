-- stop CSS from treating universal rules (*) as multiline comments
vim.bo.comments = "s1:/*,mb:*,ex:*/"
vim.opt_local.formatoptions:remove({ "r", "o" })

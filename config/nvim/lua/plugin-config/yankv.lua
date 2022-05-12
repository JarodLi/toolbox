require("yanky").setup({                                                                                                                        
   ring = {
   history_length = 10,
   storage = "shada",
   sync_with_numbered_registers = true,
   },
   system_clipboard = {
   sync_with_ring = true,
   },
   picker = {
   select = {
   action = nil, -- nil to use default put action
   },
   telescope = {
   mappings = nil, -- nil to use default mappings
   },
   },
   })

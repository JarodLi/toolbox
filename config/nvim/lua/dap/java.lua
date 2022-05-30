 -- 必须配置基本信息，配合nvim-jdtls的require("jdtls.dap").setup_dap_main_class_configs({ verbose = true })自动生成mainclass
 return {
     configurations = {
         {
             --  -- You need to extend the classPath to list your dependencies.
             --  -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
             --  classPaths = {},
             --
             --  -- If using multi-module projects, remove otherwise.
             -- projectName = "",
             --
             javaExec = "/usr/lib/jvm/java-18-openjdk/bin/java",
             -- mainClass = "",
             --
             --  -- If using the JDK9+ module system, this needs to be extended
             --  -- `nvim-jdtls` would automatically populate this property
             --  modulePaths = {},
             name = "hello java",
             request = "launch",
             type = "java",
         },
     },
 }

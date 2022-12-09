{application,mjml,
             [{compile_env,[{rustler_precompiled,[force_build,mjml],error}]},
              {applications,[kernel,stdlib,elixir,logger,rustler_precompiled]},
              {description,"mjml"},
              {modules,['Elixir.Mjml','Elixir.Mjml.Native',
                        'Elixir.Mjml.RenderOptions']},
              {registered,[]},
              {vsn,"1.4.0"}]}.

{application,bamboo_ses,
             [{compile_env,[{mail,[email_regex],error}]},
              {applications,[kernel,stdlib,elixir,logger,ex_aws_ses,bamboo,
                             mail,jason]},
              {description,"AWS SES adapter for Bamboo"},
              {modules,['Elixir.Bamboo.SesAdapter',
                        'Elixir.Bamboo.SesAdapter.RFC2822Renderer']},
              {registered,[]},
              {vsn,"0.2.0"}]}.

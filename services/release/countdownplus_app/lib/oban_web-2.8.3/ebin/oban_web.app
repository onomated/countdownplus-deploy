{application,oban_web,
             [{applications,[kernel,stdlib,elixir,logger,jason,oban,phoenix,
                             phoenix_html,phoenix_pubsub,phoenix_live_view]},
              {description,"Oban Web Component"},
              {modules,['Elixir.Oban.Web','Elixir.Oban.Web.AccessError',
                        'Elixir.Oban.Web.Components.FormComponent',
                        'Elixir.Oban.Web.DashboardLive',
                        'Elixir.Oban.Web.DashboardView',
                        'Elixir.Oban.Web.Helpers',
                        'Elixir.Oban.Web.Helpers.QueueHelper',
                        'Elixir.Oban.Web.Jobs.BulkActionComponent',
                        'Elixir.Oban.Web.Jobs.DetailComponent',
                        'Elixir.Oban.Web.Jobs.HeaderComponent',
                        'Elixir.Oban.Web.Jobs.RowComponent',
                        'Elixir.Oban.Web.Jobs.SearchComponent',
                        'Elixir.Oban.Web.Jobs.TableComponent',
                        'Elixir.Oban.Web.Jobs.TimelineComponent',
                        'Elixir.Oban.Web.JobsPage',
                        'Elixir.Oban.Web.LayoutComponent',
                        'Elixir.Oban.Web.LayoutView','Elixir.Oban.Web.Page',
                        'Elixir.Oban.Web.Plugins.Stats',
                        'Elixir.Oban.Web.Plugins.Stats.State',
                        'Elixir.Oban.Web.Query',
                        'Elixir.Oban.Web.Queues.ChildRowComponent',
                        'Elixir.Oban.Web.Queues.DetailComponent',
                        'Elixir.Oban.Web.Queues.DetailInsanceComponent',
                        'Elixir.Oban.Web.Queues.GroupRowComponent',
                        'Elixir.Oban.Web.Queues.TableComponent',
                        'Elixir.Oban.Web.QueuesPage',
                        'Elixir.Oban.Web.RefreshComponent',
                        'Elixir.Oban.Web.Resolver','Elixir.Oban.Web.Router',
                        'Elixir.Oban.Web.Search',
                        'Elixir.Oban.Web.SidebarComponent',
                        'Elixir.Oban.Web.SortComponent',
                        'Elixir.Oban.Web.Telemetry','Elixir.Oban.Web.Timing']},
              {registered,[]},
              {vsn,"2.8.3"}]}.
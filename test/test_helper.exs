ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Friendship.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Friendship.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Friendship.Repo)


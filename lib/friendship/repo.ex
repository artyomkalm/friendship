defmodule Friendship.Repo do
  use Ecto.Repo, otp_app: :friendship
  use Scrivener, page_size: 10
end

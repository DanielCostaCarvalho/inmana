defmodule Inmana.Repo do
  use Ecto.Repo,
    otp_app: :inmana,
    adapter: Ecto.Adapters.SQLite3
end

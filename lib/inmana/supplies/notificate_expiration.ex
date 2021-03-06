defmodule Inmana.Supplies.NotificateExpiration do
  alias Inmana.Supplies.{GetByExpiration, ExpirationEmail}
  alias Inmana.Mailer

  def send do
    GetByExpiration.call()
    |> Task.async_stream(fn {email, supplies} ->
      send_email(email, supplies)
    end)
    |> Stream.run()
  end

  defp send_email(email, supplies) do
    email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end

defmodule Inmana.Supplies.NotificateExpiration do
  alias Inmana.Supplies.{GetByExpiration, ExpirationEmail}
  alias Inmana.Mailer

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {email, supplies} ->
      email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end

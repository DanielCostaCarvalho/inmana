defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(email, supplies) do
    new_email(
      to: email,
      from: "contato@inmana.com",
      subject: "Suprimentos que estão próximos da validade",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "Suprimentos próximos da validade\n"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Descrição: #{description}, Validade: #{expiration_date}, Responsável: #{responsible}\n"
  end
end

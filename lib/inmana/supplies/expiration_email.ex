defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@inmana.com.br",
      subject: "You have supplies about to expire!",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "------------ Following supplies are about to expire: ------------\n"
    supplies
    |> Enum.reduce(initial_text, fn supply, text ->
      text <> "\n\n* #{supply_string(supply)}"
    end)
  end

  defp supply_string(%Supply{
    description: description,
    expiration_date: expiration_date,
    responsible: responsible
  }) do
    "#{description}\nExpires at: #{expiration_date}\nResponsible: #{responsible}"
  end
end

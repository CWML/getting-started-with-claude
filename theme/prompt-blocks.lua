-- Turn every ```text block into an outlined, labelled box with a copy button,
-- so participants can tell at a glance what to send to Claude.
-- Default label: "Prompt". Set another with {.text prompt-label="Project instructions"}.
-- The block becomes language "default" so Quarto adds its copy button
-- (plain text blocks don't get one). Styles: .prompt-block in theme/cwml.scss.
function CodeBlock(el)
  if el.classes[1] ~= "text" then return nil end
  local label = el.attributes["prompt-label"] or "Prompt"
  el.attributes["prompt-label"] = nil
  el.classes[1] = "default"
  local head = pandoc.Div({ pandoc.Plain({ pandoc.Str(label) }) }, pandoc.Attr("", { "prompt-label" }))
  return pandoc.Div({ head, el }, pandoc.Attr("", { "prompt-block" }))
end

-- In HTML (website) output, turn reveal.js speaker notes into collapsed
-- "Instructor tip" callouts and drop fragment wrappers. Reveal.js output is untouched.
if not quarto.doc.is_format("html:js") or quarto.doc.is_format("revealjs") then return {} end
return {
  Div = function(el)
    if el.classes:includes("notes") then
      return quarto.Callout({ type = "tip", title = "Instructor tip", collapse = true, content = el.content })
    end
    if el.classes:includes("fragment") then return el.content end
  end
}

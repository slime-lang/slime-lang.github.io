defmodule HtmlTest do
  use ExUnit.Case

  test "removes preceeding whitespace" do
    html = "      <br>"
    assert HTML.minify(html) == "<br>"
  end

  test "remove trailing whitespace" do
    html = "<br>      "
    assert HTML.minify(html) == "<br>"
  end

  test "does not change whitespace inside elements" do
    html = " <a   href='  foo.com'   class=' button '   > "
    assert HTML.minify(html) == "<a   href='  foo.com'   class=' button '   >"
  end

  test "does not change whitespace between elements on a line" do
    html = " <br> <br> "
    assert HTML.minify(html) == "<br> <br>"
  end

  test "removes newlines" do
    html = """
    <br>
    <br>
    """
    assert HTML.minify(html) == "<br><br>"
  end

  test "removes newlines an indents" do
    html = """
    <br>
      <br>
    """
    assert HTML.minify(html) == "<br><br>"
  end

  test "document minification" do
    html = """
    <!DOCTYPE html>
    <html>
      <head>
        <title>Slime</title>
      </head>
      <body>
        <h1>Hi</h1>
      </body>
    </html>
    """
    min = """
    <!DOCTYPE html><html><head><title>Slime</title></head><body>\
    <h1>Hi</h1></body></html>\
    """
    assert HTML.minify(html) == min
  end
end

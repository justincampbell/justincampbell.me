class TilController < ApplicationController
  def index
    @things = []

    @things << <<-THING.gsub(/^ {6}/, '')
      Ctrl+T shows you what your shell is doing.

      ```sh
      load: 1.50  cmd: ruby 11973 running 0.15u 0.03s
      ```

      Useful if you're waiting on a command, or if a script is shelling-out and
      you want to know what it's stuck on.
    THING

    @things << <<-THING.gsub(/^ {6}/, '')
      Validate/format JSON by piping to `python -m json.tool`:

      ```sh
      $ echo '{ "test": true }' | python -m json.tool
      {
            "test": true
      }

      $ echo '{ "test": true? }' | python -m json.tool
      Expecting , delimiter: line 1 column 14 (char 14)
      ```

      Comes with Python.
    THING
  end
end

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

report = %BugReport{
  owner: %Customer{name: "Dave", company: "Pragmatic"},
  details: "broken"
}

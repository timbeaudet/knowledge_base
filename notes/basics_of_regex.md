# Basics of Regular Expressions

- Use `\` to escape a regular character and give it special meaning such as:
	- `\d` is any digit 0 to 9
	- `\w` is equivalent to the alpha-numeric range; `[A-Za-z0-9_]`.
	- `\s` is equivalent to any white space characters: `_`, `\t`, `\n`, `\r`
	- Using the `\D`, `\W` or `\S` excludes the digits, alpha-numerics or white space ranges, similar to `[^/d]`.
- Special Characters / Tokens
	- To use any of these tokens as a literal character it needs to be escaped with `\`. So `\.` would be a literal `.` and not the wild-card.
	- `.` is the wild card, any character will match.
	- `*` will match the previous character/range **zero or more** times.
	- `+` will match the previous character/range **one or more** times.
	- `?` states the previous character/range is optional and will be matched 0 or 1 times.
	- `^` _(outside of a range)_ represents start of the line, so `^hello` only gets hello at the start of a line and not matching _"Tim says hello."_
	- `$` represents the end of the line, so `bye$` will match _"Tim says bye"_ but not _"Goodbye!"_
	- `|` represents logical so `(cats|dogs)` will match cats or dogs.
- To match specific characters, rather than any, `[abc]` will match only an `a`, `b`, or `c`.
- Using the `^` inside the `[^abc]` will exclude the the set of characters given, `a`, `b`, and `c`.
- Use `{3}` to allow repeatitive matches, `a{1,3}` will match at least one `a` and upto 3 `a`'s. Omitting the maximum will allo unlimited matches `w{3,}` will grab at least 3 `w`'s and up to unlimited.
- Use () to capture a group with the matching contents, can be nested to get multiple groups.

It would seem using `/expression/` is a common way to wrap the regular expressions. So `/(cat|dog)/`.

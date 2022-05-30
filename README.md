[![Hex version](https://img.shields.io/hexpm/v/dh_date.svg "Hex version")](https://hex.pm/packages/dh_date)

# Format Dates In Erlang

Original source code by Dale Harvey licensed
under the DWTFYW License

Changes by Gordon Guthrie added under the
Abbie Hoffman 'Steal This Book' License

This module formats erlang dates in the form
`{{Year, Month, Day}, {Hour, Minute, Second}}`
to printable strings, using (almost) equivalent
formatting rules as http://uk.php.net/date

Erlang has no concept of timezone so the following
formats are not implemented: `B` `e` `I` `O` `P` `T` `Z`
formats `c` and `r` will also differ slightly

See unit tests in the source code for examples

## Documentation generation

## EDoc

### Generate public API
`make docs` or `rebar3 edoc`

## Generate private API
`make doc_private` or `rebar3 as doc_private edoc`

#ExDoc

`make exdoc` or `rebar3 ex_doc --output exdoc --formatter html`
# KVServer

The KVServer application accepts commands to work with data in buckets.

All code is copied from directly from  the [tutorial](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html) and is [copyrighted by Plataformatec](https://github.com/elixir-lang/elixir-lang.github.com/#license), unless otherwise noted in the individual source files.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kv_server` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kv_server, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/kv_server](https://hexdocs.pm/kv_server).

## Starting the Server

An environment variable named `PORT` must be set in order to run the server, via mix or otherwise. If `$PORT` is not set the server won't start.

## Server Commands

### CREATE <bucket_name>
Create a bucket named `<bucket_name>`.  
Returns: `OK` if the bucket is successfully created.

### PUT <bucket_name> <item_key> <item_value>
Sets the value for `<item_key>` in the bucket `<bucket_name>` to `<item_value>`.  
Returns: `OK` if the value successfully set.

### GET <bucket_name> <item_key>
Gets the current value of `<item_key>` in the bucket `<bucket_name>`.  
Returns: The current value of `item_key`, followed by `OK`.

### DELETE <bucket_name> <item_key>
Deletes `item_key` from the bucket `<bucket_name>`.  
Returns: `OK` if the key is successfully deleted.

## Errors

- **`NOT FOUND`**: Returned if the requested bucket doesn't exist.
- **`UNKNOWN COMMAND`**: Returned if an invalid command is given. Valid commands are `CREATE`, `PUT`, `GET`, or `DELETE`.
- **`ERROR`**: Returned when any other error condition is triggered.

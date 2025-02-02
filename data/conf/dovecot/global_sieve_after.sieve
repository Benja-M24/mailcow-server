# global_sieve_after.sieve script
# global_sieve_before -> user sieve_before (mailcow UI) -> user sieve_after (mailcow UI) -> global_sieve_after.sieve

require "fileinto";
require "mailbox";
require "variables";
require "subaddress";
require "envelope";
require "duplicate";

if header :contains "X-Spam-Flag" "YES" {
  fileinto "Junk";
}

if allof (
  envelope :detail :matches "to" "*",
  header :contains "X-Moo-Tag" "YES"
  ) {
  set :lower :upperfirst "tag" "${1}";
  if mailboxexists "INBOX/${1}" {
    fileinto "INBOX/${1}";
  } else {
    fileinto :create "INBOX/${tag}";
  }
}

if duplicate {
  discard;
  stop;
}
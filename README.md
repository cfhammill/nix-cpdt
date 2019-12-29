# Nix Builder for Certified Programming with Dependent Types

I wanted to follow along with Adam Chlipala's book [Certified Programming
with Dependent Types](http://adam.chlipala.net/cpdt/) and figured it ought to have a nix build. I may
at some point PR this to nixpkgs, but for now here it is.

Comes with a shell.nix so just clone the repo and run nix-shell
and you can start using Cpdt tactics. Library lives in the
namespace `Cpdt`, with the most useful module `Cpdt.CpdtTactics`
containing the infamous `crush` tactic.

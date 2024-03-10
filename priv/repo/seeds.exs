# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Demo.Repo.insert!(%Demo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Demo.Repo
alias Demo.Directory.Business

Repo.insert! %Business{name: "Otega Sons", description: "Otega Sons is a family owned venture", tag: "IT, Software"}
Repo.insert! %Business{name: "Ije Iku", description: "Ije Iku is an online business center", tag: "E-commerce"}
Repo.insert! %Business{name: "Grace's Law Firm", description: "Grace's Law firm is a leading Attorney Law firm aimed at helping people who can't afford thier personal Attorney's", tag: "Marketing"}
(ch_branchprotect)=
# Protecting the main branch

Collaborating with people can be chaotic. Protecting the main branch ensures that only reviewed code is merged into the projects main branch. It prevents accidental changes and keeps the project reliable for everyone working on it.

Follow the steps below to create a rule that protects your main branch.

```{figure} figures/repo_settings.png
:width: 80%
:label: fig_repo_settings

On your repository home page, click "Settings" in the navigation bar.
```

```{figure} figures/repo_rules.png
:width: 80%
:label: fig_repo_rulesets

Navigate to the the Rulesets tab.
```

```{figure} figures/repo_new_rule.png
:width: 80%
:label: fig_repo_newrule

Create a new branch ruleset.
```

```{figure} figures/repo_rule_1.png
:width: 80%
:label: fig_repo_rule1

Give your rule a name and make sure the enforcement status is set to "Active". Proceed by adding the default branch to the rule target.
```

```{figure} figures/repo_rule_2.png
:width: 80%
:label: fig_repo_rule2

Enable "Require a pull request before merging" and set the required approvals to 1. Leave the other options unchanged. You can now create the ruleset at the bottom of the page.
```
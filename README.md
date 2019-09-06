Composer Upstream Prototypes
============================

This project demonstrates different options for using Composer with Pantheon
upstreams.

Use Cases
=========

As a Pantheon user with a site created from a composer-based upstreamI want my site’s composer.json to include the configuration from my upstream by reference onlyso that I can focus on my site’s dependencies without the noise of the upstream’s many dependencies

As a Pantheon user with a site created from a composer-based upstreamI want new dependencies added to the upstream to be available as a 1-click updateso that I can easily get any updates from the upstream

As a Pantheon user with a site created from a composer-based upstreamI want dependencies removed from the upstream to be available as a 1-click updateso that I can easily remove unneeded code from my site

As a Pantheon user with a site created from a composer-based upstreamI want to apply upstream updates without merge conflictsso that I can focus on my site and not resolving merge conflicts

Options
=======

This repository contains three alternative options for meeting our needs to use Composer with upstreams.

Use wikimedia merge plugin
--------------------------

This option uses the Wikimedia merge plugin to include the upstream.composer.json from a file stored directly at the root of the upstream repository.

Pros:

- Allows upstream composer.json to set configuration properties that may only go in the root-level composer.json file.
- The upstream composer.json is stored in the same repository as the other upstream files.
- The upstream composer.json file may have any arbitrary name, and can go at the project root.

Cons:

- The wikimedia merge plugin is no longer well-maintained, and projects are moving away from using it.

Path repository from top-level composer.json to upstream/composer.json
----------------------------------------------------------------------

Similar to option 1, but instead uses a path repository to include upstream/composer.json from a subfolder stored directly in the upstream repository.

Pros:

- Based on standard Composer features (no additional Composer plugins required).
- The upstream composer.json is stored in the same repository as the other upstream files.

Cons:

- Upstream composer.json is considered a dependency, and therefore cannot set configuration properties that may only go in the root-level composer.json file.
- The composer.json file must be named literally composer.json (no variants allowed) and must go in a subfolder.

Require an external project from top-level composer.json
--------------------------------------------------------

This option requires an external project that has been registered with Packagist.

Pros:

- Could potentially be used in multiple upstreams.

Cons:

- Upstream composer.json is not stored in the same repository as the other upstream files.
- Requires registering with Packagist and managing releases.
- Keeping upstream metadata private requires Private Packagist, an additional expense.

Recommendation
--------------

While the Wikimedia merge plugin is more flexible and meets our design criteria most closely, it should probably be avoided due to the fact that it is not well maintained, and is falling out of favor.

A path repository provides most of the benefits of the Wikimedia merge plugin, and is built with standard Composer features. It is therefore probably the preferable option, in the balance.

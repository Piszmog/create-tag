# create-tag

A GitHub Action to tag a commit with a valid semantic version.

## Inputs

| Name    | Required | Description                                                                         |
|---------|----------|-------------------------------------------------------------------------------------|
| `token` | True     | GitHub Token used to query files in the repository and commit changes to the branch |
| `version` | True     | The version to create the tag as.     |
| `message` | True     | The tag message.                   |

## Example Usage

```yaml
name: Tag

on:
  workflow_dispatch:
    inputs:
      version:
        description: 'Release version (e.g. v0.1.0)'
        required: true
      message:
        description: 'Tag message'
        required: true

jobs:
  create-tag:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Create Tag
        uses: piszmog/create-tag@v1
        with:
          version: ${{ github.event.inputs.version }}
          message: ${{ github.event.inputs.message }}
          token: ${{ secrets.GITHUB_TOKEN }}
```

## Development

To update GitHub action that is pulled by users,

1. Update the version in `package.json`
2. Run `./moveMajor.sh`

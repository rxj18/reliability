## Prerequisite
Make sure that you are inside your repo's root when running these commands

## Download

```bash
curl -O https://raw.githubusercontent.com/rxj18/reliability/main/index.html \
     -O https://raw.githubusercontent.com/rxj18/reliability/main/coverage.sh
```

## Usage

Download the latest coverage report by running this:
```bash
./coverage <COMMIT_HASH>
```

To view the coverage report, run:
```bash
python3 -m http.server 8000
```

You can also use any other live server tool if you don't want to use python3

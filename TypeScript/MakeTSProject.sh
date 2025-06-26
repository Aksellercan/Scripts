TARGET_DIR="$(pwd)"

#check if name is given
if [ -z "$1" ]; then
    echo "Error: No project name provided!"
    echo "Usage: $0 <project-name>"
    exit 1
fi

name="$1"
fulldir=${TARGET_DIR}/${name}
mkdir ${fulldir}
echo "created project in ${fulldir}"

cd ${fulldir}

#initialize
npm init -y

tsc --init --sourceMap --rootDir src --outDir dist

mkdir ${fulldir}/src

#touch ${fulldir}/src/index.ts

#pre-write code for compilation
echo 'console.log("Hello, World!");' > ${fulldir}/src/index.ts

#compile to create dist folder
tsc

#configure launch.json
mkdir ${fulldir}/.vscode

touch ${fulldir}/.vscode/launch.json

echo '{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [

        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "skipFiles": [
                "<node_internals>/**"
            ],
            "program": "${workspaceFolder}/dist/index.js",
            "outFiles": [
                "${workspaceFolder}/**/*.js"
            ]
        }
    ]
}' > ${fulldir}/.vscode/launch.json

#watch changes inside project
npm i --save-dev typescript

touch ${fulldir}/.vscode/tasks.json

echo '{
	"version": "2.0.0",
	"tasks": [
		{
			"type": "typescript",
			"tsconfig": "tsconfig.json",
			"option": "watch",
			"problemMatcher": [
				"$tsc-watch"
			],
			"group": {
				"kind": "build",
				"isDefault": true
			},
			"label": "tsc: watch - tsconfig.json"
		}
	]
}' > ${fulldir}/.vscode/tasks.json

#open in vscode
code ${fulldir}

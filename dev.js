import { spawn } from 'child_process';

[
  spawn('npm', ['run', 'dev:spago']),
  spawn('npm', ['run', 'dev:tailwind']),
  spawn('npm', ['run', 'dev:vite']),
].forEach((run) => {
  run.stdout.on('data', (data) => {
    console.log(data.toString());
  });

  run.stderr.on('data', (data) => {
    console.error(data.toString());
  });
});


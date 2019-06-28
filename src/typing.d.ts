declare var nprocess: Process;

interface Process {
  env: Env;
}

interface Env {
  USERNAME: string;
}

interface GlobalEnvironment {
  nprocess: Process;
}

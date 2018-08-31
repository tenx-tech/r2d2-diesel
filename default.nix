{ tenxRustDep, externalRustDep, fetchcrateLocal, fetchRepoRef }: 
let 
  defaultDiesel = externalRustDep {
    name = "diesel";
    src = (fetchRepoRef ./diesel.src.json) + "/diesel";
  };
in
  { diesel ? defaultDiesel }:
  tenxRustDep {
     name = "r2d2-diesel";
     src = fetchcrateLocal ./. { blacklistedFiles = ["Cargo.lock"]; };
     dependencies = [diesel];
  }
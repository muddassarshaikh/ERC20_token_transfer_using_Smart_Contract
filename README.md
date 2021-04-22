# sample_token

Creation of ERC20 token transfer functionality using standard openZeppelin and testing it using truffle

## Step for running this project

1. Download and run [Ganache](https://www.trufflesuite.com/ganache)
2. Install truffle globally

```sh
      npm install -g truffle
```

3. Install all dependencies

```sh
      npm install
```

4. Then compile the sample token file

```sh
      truffle compile
```

5. i) Deploy the project on ganache network

```sh
      truffle migrate --reset
```

5. ii) Deploy the project on rinkeby test network
   Uncomment rinkeby network setting in truffle-config.js file and comment the developement network

```sh
      truffle migrate --network rinkeby
```

6. Then do unit testing

```sh
      truffle test
```

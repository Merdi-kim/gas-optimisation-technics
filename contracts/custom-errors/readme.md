# Use custom errors instead of “require”
**require** is a reserved keyword in solidity that helps us enforce a certain rule in our functions. The skeleton of a ‘require’ function is as follows:`require(condition,” message”)`. This means that if the condition inside the `require` is not matched, the function reverts and throws a `message`. The problem with this approach is that the `message` string can become quite long and since that gets stored in storage, it can consume more storage which leads to more gas. In case this `message` is pretty short, we can keep the `require` function, but when it becomes long, we can use a custom error.
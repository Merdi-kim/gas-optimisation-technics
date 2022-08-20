# Mapping vs Array
Mappings and arrays are both useful when it comes to storing data. However once the data to store starts to grow more and more, the choice of the storage structure may lead to more or less gas consumption. Arrays and mappings can play the same role in some scenarios and they can all be gas efficient depending on the case, it is up to you to choose one according to your needs. Imagine you have a donation Contract and you need to keep track of who has donated money. You can decide to store the addresses that have donated inside an array or a mapping. But the real question is which one of the two is going to be more gas efficient while checking if someone has donated or not? You have probably guessed it, it is the mapping. To check if an address is inside an array, we’ll need to loop through that array till we find the address. That operation is way more expensive. But when we use mapping for that operation, it is very cheap and straight to the point. The example below illustrates it very well.
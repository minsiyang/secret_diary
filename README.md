# Secret Diary

A TDD and Encapsulation pracitce to implement classes and their responsibility.

```
As a user
So that I can write down my thoughts
I want to be able to add an entry to my secret diary
```

```
As a user
So that I can recall my thoughts
I want to be able to retrieve entries to my secret diary
```

```
As a user
So that I can access to my secret diary
I want to be able to unlock my secret diary
```

``` 
As a user
So that I can keep my diary secret
I want to be able to lock my secret diary
```

|   **Class**               |  **Method**  |
| :--                       |  :--         |
|  SecretDiary(in charge of security of access, colaborting with Diary class) | .unlock  |
|                                                                          | .lock    |
|                                                                          | .add_entry(title, content) |
|                                                                          | .get_entries |
|  Diary(in charge of all diary items)  | .add(title, content)  |
|                                       | .view                 |         
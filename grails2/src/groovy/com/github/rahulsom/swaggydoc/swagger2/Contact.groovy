package com.github.rahulsom.swaggydoc.swagger2

/**
 * Created by jamesxabregas on 11/3/17.
 */
class Contact {
    String name
    String url
    String email

    Contact(Map<String, String> contact) {
        name = contact?.name
        url = contact?.url
        email = contact?.email
    }
}

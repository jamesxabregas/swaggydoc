package com.github.rahulsom.swaggydoc.swagger2

/**
 * Created by jamesxabregas on 11/3/17.
 */
class License {
    String name
    String url

    License(Map<String, String> license) {
        name = license?.name
        url = license?.url
    }
}

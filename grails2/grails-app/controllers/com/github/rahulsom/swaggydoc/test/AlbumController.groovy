package com.github.rahulsom.swaggydoc.test

import com.wordnik.swagger.annotations.Api
import grails.rest.RestfulController

@Api("album")
class AlbumController extends RestfulController<Album> {
    static responseFormats = ['json', 'xml']

    AlbumController() {
        super(Album)
    }

    @Override
    def show() {
        super.show()
    }

    @Override
    def index(Integer max) {
        super.index(max)
    }

    @Override
    def save() {
        super.save()
    }

    @Override
    def edit() {
        super.edit()
    }

    @Override
    def patch() {
        super.patch()
    }

    @Override
    def update() {
        super.update()
    }

    @Override
    def delete() {
        super.delete()
    }
}

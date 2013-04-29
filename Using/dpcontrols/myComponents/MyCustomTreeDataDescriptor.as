package myComponents
// myComponents/MyCustomTreeDataDescriptor.as
{
import mx.collections.ArrayCollection;
import mx.collections.CursorBookmark;
import mx.collections.ICollectionView;
import mx.collections.IViewCursor;
import mx.events.CollectionEvent;
import mx.events.CollectionEventKind;
import mx.controls.treeClasses.*;

public class MyCustomTreeDataDescriptor implements ITreeDataDescriptor
{

    // The getChildren method requires the node to be an Object
    // with a children field.
    // If the field contains an ArrayCollection, it returns the field
    // Otherwise, it wraps the field in an ArrayCollection.
    public function getChildren(node:Object,
        model:Object=null):ICollectionView
    {
        try
        {
            if (node is Object) {
                if(node.children is ArrayCollection){
                    return node.children;
                }else{
                    return new ArrayCollection(node.children);
                }
            }
        }
        catch (e:Error) {
            trace("[Descriptor] exception checking for getChildren");
        }
        return null;
    }

    // The isBranch method simply returns true if the node is an
    // Object with a children field.
    // It does not support empty branches, but does support null children
    // fields.
    public function isBranch(node:Object, model:Object=null):Boolean {
        try {
            if (node is Object) {
                if (node.children != null)  {
                    return true;
                }
            }
        }
        catch (e:Error) {
            trace("[Descriptor] exception checking for isBranch");
        }
        return false;
    }

    // The hasChildren method Returns true if the
    // node actually has children. 
    public function hasChildren(node:Object, model:Object=null):Boolean {
        if (node == null) 
            return false;
        var children:ICollectionView = getChildren(node, model);
        try {
            if (children.length > 0)
                return true;
        }
        catch (e:Error) {
        }
        return false;
    }
    // The getData method simply returns the node as an Object.
    public function getData(node:Object, model:Object=null):Object {
        try {
            return node;
        }
        catch (e:Error) {
        }
        return null;
    }

    // The addChildAt method does the following:
    // If the parent parameter is null or undefined, inserts
    // the child parameter as the first child of the model parameter.
    // If the parent parameter is an Object and has a children field,
    // adds the child parameter to it at the index parameter location.
    // It does not add a child to a terminal node if it does not have
    // a children field.
    public function addChildAt(parent:Object, child:Object, index:int, 
            model:Object=null):Boolean {
        var event:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
        event.kind = CollectionEventKind.ADD;
        event.items = [child];
        event.location = index;
        if (!parent) {
            var iterator:IViewCursor = model.createCursor();
            iterator.seek(CursorBookmark.FIRST, index);
            iterator.insert(child);
        }
        else if (parent is Object) {
            if (parent.children != null) {
                if(parent.children is ArrayCollection) {
                    parent.children.addItemAt(child, index);
                    if (model){
                        model.dispatchEvent(event);
                        model.itemUpdated(parent);
                    }
                    return true;
                }
                else {
                    parent.children.splice(index, 0, child);
                    if (model)
                        model.dispatchEvent(event);
                    return true;
                }
            }
        }
        return false;
    }

    // The removeChildAt method does the following:
    // If the parent parameter is null or undefined,
    // removes the child at the specified index
    // in the model.
    // If the parent parameter is an Object and has a children field,
    // removes the child at the index parameter location in the parent.
    public function removeChildAt(parent:Object, child:Object, index:int, model:Object=null):Boolean
    {
        var event:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
        event.kind = CollectionEventKind.REMOVE;
        event.items = [child];
        event.location = index;

        //handle top level where there is no parent
        if (!parent)
        {
            var iterator:IViewCursor = model.createCursor();
            iterator.seek(CursorBookmark.FIRST, index);
            iterator.remove();
            if (model)
                model.dispatchEvent(event);
            return true;
        }
        else if (parent is Object)
        {
            if (parent.children != undefined)
            {
                parent.children.splice(index, 1);
                if (model) 
                    model.dispatchEvent(event);
                return true;
            }
        }
        return false;
    }

}
}
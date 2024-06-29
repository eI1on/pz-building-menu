Events.OnBuildActionPerformed.Add(function(isBuildingObject)
    if isBuildingObject and isBuildingObject.javaObject then
        print("self.javaObject ", isBuildingObject.javaObject)
    end
end)

Events.OnBeforeSetDragBuildObject.Add(function(buildObject)
    if buildObject and buildObject.name then
        print("buildObject.name ", buildObject.name)
    end
end)
%Robert Tremblay

kMeansPlot = zeros(100,100);
%get points that need clustering
plotWithPoints = getPoints(kMeansPlot);
%get K from user
k = input("Number of Clusters 1-10: ");
%get randomized initial centers
centroidXs = randsample(100, k);
centroidYs = randsample(100, k);
centroid;
for i = 1:k
    centroid(i,1) = centroidXs(i);
    centroid(i,2) = centroidYs(i);
end
for m = 1:100
    %group points by cluster
    for i = 1:100
        for j = 1:100
            if plotWithPoints(i,j) ~= 0
                dist = zeros(k);
                for a = 1:k
                    dist(a) = sqrt(((i-centroid(a,1))^2) + ((j-centroid(a,2))^2));
                end
                y=0;
                [x,y] = min(dist);
                plotWithPoints(i,j) = y(1);
            end
        end
    end
    newCentroids = 0;
    %update centroids to be center of each cluster
    for l = 1:k
        divideBy = 0;
        xHelper = 0;
        yHelper = 0;
        for i = 1:100
            for j = 1:100
                if plotWithPoints(i,j) == l
                    xHelper = xHelper + i;
                    yHelper = yHelper + j;
                    divideBy = divideBy + 1;
                end
            end
        end
        if divideBy == 0
            newCentroids(l,1) = centroid(l,1);
            newCentroids(l,2) = centroid(l,2);
        end
        if divideBy ~= 0
            newCentroidx = xHelper/divideBy;
            newCentroidy = yHelper/divideBy;
            newCentroids(l,1) = newCentroidx;
            newCentroids(l,2) = newCentroidy;
        end
    end
    centroid = newCentroids;
end
%create final image to visualize clusters
final = zeros(100,100,3);
for i = 1:100
    for j = 1:100
        if plotWithPoints(i,j) == 1
            final(i,j,1) = 255;
            final(i,j,2) = 0;
            final(i,j,3) = 0;
        elseif plotWithPoints(i,j) == 2
            final(i,j,1) = 0;
            final(i,j,2) = 255;
            final(i,j,3) = 0;
        elseif plotWithPoints(i,j) == 3
            final(i,j,1) = 0;
            final(i,j,2) = 0;
            final(i,j,3) = 255;
        elseif plotWithPoints(i,j) == 4
            final(i,j,1) = 255;
            final(i,j,2) = 255;
            final(i,j,3) = 0;
        elseif plotWithPoints(i,j) == 5
            final(i,j,1) = 0;
            final(i,j,2) = 255;
            final(i,j,3) = 255;
        elseif plotWithPoints(i,j) == 6
            final(i,j,1) = 255;
            final(i,j,2) = 0;
            final(i,j,3) = 255;
        elseif plotWithPoints(i,j) == 7
            final(i,j,1) = 255;
            final(i,j,2) = 255;
            final(i,j,3) = 255;
        elseif plotWithPoints(i,j) == 8
            final(i,j,1) = 100;
            final(i,j,2) = 230;
            final(i,j,3) = 80;
        elseif plotWithPoints(i,j) == 9
            final(i,j,1) = 80;
            final(i,j,2) = 255;
            final(i,j,3) = 100;
        elseif plotWithPoints(i,j) == 10
            final(i,j,1) = 200;
            final(i,j,2) = 100;
            final(i,j,3) = 100;
        end
    end
end
figure
final = uint8(final);
imshow(final)
title("final")


function plotWithPoints = getPoints(originalPlot)
    keepGoing = true;
    while keepGoing
        pointToAddX = input("If done enter type 0 otherwise Enter Point X Value: ");
        pointToAddY = input("If done enter type 0 otherwise Enter Point Y Value: ");
        if pointToAddX == 0
            keepGoing = false;
        else
            originalPlot(pointToAddX,pointToAddY) = 1;
        end
    end
    plotWithPoints = originalPlot;
end
